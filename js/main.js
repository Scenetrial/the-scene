// Function to load content from JSON
async function loadContent() {
    try {
        const response = await fetch('./data/content.json');
        const data = await response.json();
        updateContent(data);
    } catch (error) {
        console.error('Error loading content:', error);
    }
}

// Function to update page content
function updateContent(data) {
    // Update hero section
    document.querySelector('.hero-content h1').textContent = data.hero.title;
    document.querySelector('.hero-text').textContent = data.hero.subtitle;

    // Update features
    const featuresContainer = document.querySelector('.features-grid');
    featuresContainer.innerHTML = data.features.map(feature => `
        <div class="feature-card">
            <span class="feature-number">${feature.number}</span>
            <h3>${feature.title}</h3>
            <p>${feature.description}</p>
        </div>
    `).join('');

    // Update venues
    const venuesContainer = document.querySelector('.venue-slider');
    venuesContainer.innerHTML = data.venues.map(venue => `
        <div class="venue-card">
            <div class="venue-status ${venue.status === 'Live Now' ? 'active' : ''}">${venue.status}</div>
            <h3>${venue.name}</h3>
            <div class="venue-details">
                <span class="crowd-level">Crowd: ${venue.crowdLevel}</span>
                <span class="wait-time">Wait: ${venue.waitTime}</span>
            </div>
            <p>${venue.description}</p>
        </div>
    `).join('');

    // Update events
    const eventsContainer = document.querySelector('.events-grid');
    eventsContainer.innerHTML = data.events.map(event => `
        <div class="event-card">
            <div class="event-date">
                <span class="day">${event.date.day}</span>
                <span class="month">${event.date.month}</span>
            </div>
            <div class="event-info">
                <h3>${event.title}</h3>
                <p class="event-venue">@ ${event.venue}</p>
                <p class="event-time">${event.time}</p>
            </div>
        </div>
    `).join('');

    // Update contact information
    document.querySelector('.contact-list').innerHTML = `
        <li>Email: ${data.contact.email}</li>
        <li>Phone: ${data.contact.phone}</li>
        <li>Hours: ${data.contact.hours}</li>
    `;

    // Update social links
    document.querySelector('.social-links').innerHTML = `
        <a href="${data.social.instagram}">Instagram</a>
        <a href="${data.social.twitter}">Twitter</a>
        <a href="${data.social.linkedin}">LinkedIn</a>
    `;
}

// Load content when page loads
document.addEventListener('DOMContentLoaded', loadContent);

// Handle notification form submission
document.querySelector('.notify-form').addEventListener('submit', async function(e) {
    e.preventDefault();
    const email = this.querySelector('input[type="email"]').value;
    
    try {
        const response = await fetch('https://api.thescenehub.com/notify', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ email })
        });

        if (response.ok) {
            alert('Thank you! We\'ll notify you when The Scene app launches.');
            this.reset();
        } else {
            alert('Something went wrong. Please try again later.');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Something went wrong. Please try again later.');
    }
}); 