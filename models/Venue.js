const mongoose = require('mongoose');

const venueSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    address: {
        street: String,
        city: String,
        state: String,
        zipCode: String,
        country: String,
        required: true
    },
    coordinates: {
        latitude: Number,
        longitude: Number
    },
    images: [{
        type: String,
        required: true
    }],
    capacity: {
        type: Number,
        required: true
    },
    amenities: [{
        type: String
    }],
    operatingHours: {
        monday: { open: String, close: String },
        tuesday: { open: String, close: String },
        wednesday: { open: String, close: String },
        thursday: { open: String, close: String },
        friday: { open: String, close: String },
        saturday: { open: String, close: String },
        sunday: { open: String, close: String }
    },
    contact: {
        phone: String,
        email: String,
        website: String
    },
    status: {
        type: String,
        required: true,
        enum: ['active', 'inactive', 'pending'],
        default: 'active'
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
venueSchema.pre('save', function(next) {
    this.updatedAt = Date.now();
    next();
});

module.exports = mongoose.model('Venue', venueSchema); 