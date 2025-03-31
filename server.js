const express = require('express');
const nodemailer = require('nodemailer');
const cors = require('cors');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());

// Create email transporter
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
    }
});

// Handle notification requests
app.post('/notify', async (req, res) => {
    const { email } = req.body;
    
    try {
        // Send confirmation email to subscriber
        await transporter.sendMail({
            from: process.env.EMAIL_USER,
            to: email,
            subject: 'Welcome to The Scene - Coming Soon!',
            html: `
                <h1>Welcome to The Scene!</h1>
                <p>Thank you for signing up to be notified when The Scene app launches.</p>
                <p>We'll keep you updated on our progress and let you know as soon as the app is available on the App Store.</p>
                <br>
                <p>Best regards,</p>
                <p>The Scene Team</p>
            `
        });

        // Send notification to admin
        await transporter.sendMail({
            from: process.env.EMAIL_USER,
            to: 'info@thescenehub.com',
            subject: 'New Subscriber Alert',
            html: `
                <h2>New Subscriber</h2>
                <p>Email: ${email}</p>
                <p>Time: ${new Date().toLocaleString()}</p>
            `
        });

        res.status(200).json({ message: 'Notification sent successfully' });
    } catch (error) {
        console.error('Error sending email:', error);
        res.status(500).json({ error: 'Failed to send notification' });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
}); 