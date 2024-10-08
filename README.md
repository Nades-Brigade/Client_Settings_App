# Install and Run ClientSettings (Not LiveView)
## 1. Clone the Project from GitHub (or Zip the Files)

### Clone the repository:
The project is hosted on GitHub, clone the repository:
```bash
git clone https://github.com/Nades-Brigade/Client_Settings_App.git
```

### Navigate to the project directory:
```bash
cd client_settings_app
```

---

## 2. Install Dependencies

### Install Phoenix dependencies:
Run the following command to install all necessary for the "Non-Live View":
```bash
mix deps.get
```

---

## 3. Configure the Database

### Database Setup:
Run the following command to create the database:
```bash
mix ecto.create
```

### Run Migrations:
Once the database is set up, run the migrations to establish the database schema:
```bash
mix ecto.migrate
```

---

## 5. Compile the Application

Compile the Phoenix application:
```bash
mix compile
```

---

## 6. Run the Application

Once everything is configured, run the Phoenix server:
```bash
mix phx.server
```

Visit `http://localhost:4000/` in your browser to access the app.

---

### Summary Checklist:

1. Install Elixir, Phoenix, and PostgreSQL.
2. Clone or the project.
3. Install dependencies (`mix deps.get` and `npm install`).
4. Set up and configure the database (`mix ecto.create` and `mix ecto.migrate`).
5. Compile the application (`mix compile`).
6. Run the application (`mix phx.server`).


# Application Documentation 
## 1. Install Dependencies

### Install Phoenix dependencies (if not done so already):
Run the following command to install all necessary dependencies for the "Non-Live View":
```bash
mix deps.get
```

---
## 2. Create docs

Once dependencies are completed, create the docs using ex_doc:
```bash
mix docs
```

---
## 3. Navigate to /doc directory

Then navigate into the /doc folder:
```bash
cd doc
```

---
## 4. Open the documentation

Open documentation by running the following:
```bash
open index.html
```

---
