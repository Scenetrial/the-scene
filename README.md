# The Scene Website

A modern, responsive website for The Scene app that shows real-time venue information and upcoming events.

## How to Update Content

The website content can be easily updated by modifying the `data/content.json` file. Here's how to update different sections:

### Hero Section
```json
"hero": {
    "title": "Your new title here",
    "subtitle": "Your new subtitle here"
}
```

### Features
Add or modify features in the "features" array:
```json
{
    "number": "01",
    "title": "Feature title",
    "description": "Feature description"
}
```

### Venues
Update venue information in the "venues" array:
```json
{
    "name": "Venue name",
    "status": "Live Now or Opening Soon",
    "crowdLevel": "Percentage or --",
    "waitTime": "Time or None",
    "description": "Venue description"
}
```

### Events
Add or modify events in the "events" array:
```json
{
    "date": {
        "day": "15",
        "month": "MAR"
    },
    "title": "Event title",
    "venue": "Venue name",
    "time": "Event time"
}
```

### Contact Information
Update contact details:
```json
"contact": {
    "email": "your@email.com",
    "phone": "Your phone number",
    "hours": "Your business hours"
}
```

### Social Links
Update social media links:
```json
"social": {
    "instagram": "Your Instagram URL",
    "twitter": "Your Twitter URL",
    "linkedin": "Your LinkedIn URL"
}
```

## How to Deploy Changes

1. Edit the `data/content.json` file with your changes
2. Commit your changes:
   ```bash
   git add data/content.json
   git commit -m "Update website content"
   git push
   ```
3. Your changes will be live in a few minutes

## Development

To run the website locally:
1. Clone this repository
2. Open `index.html` in your browser
3. For content changes, modify `data/content.json`
4. For style changes, modify `styles.css`
5. For functionality changes, modify `js/main.js` 