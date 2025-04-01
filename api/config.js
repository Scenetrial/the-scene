const config = {
    // API endpoints
    endpoints: {
        events: '/api/events',
        venues: '/api/venues',
        users: '/api/users',
        analytics: '/api/analytics'
    },
    
    // Webhook endpoints for app updates
    webhooks: {
        eventUpdate: '/webhooks/events',
        venueUpdate: '/webhooks/venues',
        userUpdate: '/webhooks/users'
    },
    
    // Authentication
    auth: {
        secret: process.env.WEBHOOK_SECRET || 'your-secret-key',
        tokenExpiry: '24h'
    },
    
    // Database configuration (you'll need to set this up)
    database: {
        url: process.env.DATABASE_URL,
        options: {
            useNewUrlParser: true,
            useUnifiedTopology: true
        }
    }
};

module.exports = config; 