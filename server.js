const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const config = require('./api/config');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Connect to MongoDB
mongoose.connect(config.database.url, config.database.options)
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error('MongoDB connection error:', err));

// Models
const Event = require('./models/Event');
const Venue = require('./models/Venue');
const User = require('./models/User');

// API Routes
app.get(config.endpoints.events, async (req, res) => {
    try {
        const events = await Event.find().sort({ date: 1 });
        res.json(events);
    } catch (error) {
        res.status(500).json({ error: 'Error fetching events' });
    }
});

app.get(config.endpoints.venues, async (req, res) => {
    try {
        const venues = await Venue.find();
        res.json(venues);
    } catch (error) {
        res.status(500).json({ error: 'Error fetching venues' });
    }
});

// Webhook endpoints for app updates
app.post(config.webhooks.eventUpdate, async (req, res) => {
    try {
        const { eventId, action, data } = req.body;
        
        switch (action) {
            case 'create':
                await Event.create(data);
                break;
            case 'update':
                await Event.findByIdAndUpdate(eventId, data);
                break;
            case 'delete':
                await Event.findByIdAndDelete(eventId);
                break;
        }
        
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ error: 'Error processing event update' });
    }
});

app.post(config.webhooks.venueUpdate, async (req, res) => {
    try {
        const { venueId, action, data } = req.body;
        
        switch (action) {
            case 'create':
                await Venue.create(data);
                break;
            case 'update':
                await Venue.findByIdAndUpdate(venueId, data);
                break;
            case 'delete':
                await Venue.findByIdAndDelete(venueId);
                break;
        }
        
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ error: 'Error processing venue update' });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
}); 