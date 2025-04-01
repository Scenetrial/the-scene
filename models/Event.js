const mongoose = require('mongoose');

const eventSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    date: {
        type: Date,
        required: true
    },
    venue: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Venue',
        required: true
    },
    image: {
        type: String,
        required: true
    },
    price: {
        type: Number,
        required: true
    },
    capacity: {
        type: Number,
        required: true
    },
    category: {
        type: String,
        required: true,
        enum: ['Music', 'Art', 'Food', 'Sports', 'Other']
    },
    status: {
        type: String,
        required: true,
        enum: ['upcoming', 'ongoing', 'completed', 'cancelled'],
        default: 'upcoming'
    },
    createdAt: {
        type: Date,
        default: Date.now
    },
    updatedAt: {
        type: Date,
        default: Date.now
    }
});

// Update the updatedAt timestamp before saving
eventSchema.pre('save', function(next) {
    this.updatedAt = Date.now();
    next();
});

module.exports = mongoose.model('Event', eventSchema); 