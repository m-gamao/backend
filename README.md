This is a sms messenger application using Angular, Ruby on Rails, MongoDB and Twilio. 

To use this app:

- Enter a phone number (must be verified with Twilio if you're on a free trial)
- Type a message and click Send
- Messages will appear in the message history panel
- Messages are tied to a session using secure cookies

# MySMS Messenger

**MySMS Messenger** is a full-stack web application that allows users to send SMS messages and view their message history.

It features:

- **Angular Frontend** — Simple UI for inputting phone numbers and messages
- **Ruby on Rails API** — Secure backend handling message delivery and storage
- **MongoDB (Atlas)** — Persists messages per user session
- **Twilio Integration** — Sends real SMS messages via Twilio API

---

## Tech Stack

| Layer        | Tech                      |
|--------------|---------------------------|
| Frontend     | Angular 17 (Standalone API) |
| Backend      | Ruby on Rails 7 (API Mode) |
| Database     | MongoDB Atlas (via Mongoid) |
| Messaging    | Twilio Programmable SMS   |

---

## Local Development Setup

You’ll need **Node.js**, **Ruby (3.2+)**, **MongoDB Atlas**, and a **Twilio account**.

### Backend Setup (Rails API)

```bash
git clone https://github.com/your-username/mysms-messenger.git
cd mysms-messenger/backend
bundle install
touch .env

Add the following to .env:

MONGODB_URI=mongodb+srv://<user>:<encoded_password>@<your-cluster>.mongodb.net/?retryWrites=true&w=majority&appName=<your-app-name>
TWILIO_ACCOUNT_SID=your_twilio_sid
TWILIO_AUTH_TOKEN=your_twilio_auth_token
TWILIO_PHONE_NUMBER=+1XXXXXXXXXX


Then:
rails server

Backend will run at: http://localhost:3000/api/messages

## Frontend Setup (Angular)

cd ../frontend
npm install
ng serve

Frontend runs at: http://localhost:4200


Testing

- Enter a phone number (must be verified with Twilio if you're on a free trial)
- Type a message and click Send
- Messages will appear in the message history panel
- Messages are tied to a session using secure cookies

🔐 Security Notes
- CORS and CSRF protection are enabled
- Session tracking is done via cookies.signed[:session_id]
- Ensure environment variables are never committed to version control

🚀 Deployment Notes (Optional)
- You can deploy this app using:
- Backend: Render (free for Rails API)
- Frontend: Vercel or Netlify





# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
