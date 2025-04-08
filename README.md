# Node.js PostgreSQL Sequelize Project

This project is a Node.js application that connects to a PostgreSQL database using Sequelize ORM. It provides a simple API to manage user data.

## Project Structure

```
nodejs-postgres-sequelize
├── src
│   ├── app.ts
│   ├── config
│   │   └── database.ts
│   ├── models
│   │   └── user.model.ts
│   ├── services
│   │   └── user.service.ts
│   ├── controllers
│   │   └── user.controller.ts
│   └── routes
│       └── user.routes.ts
├── package.json
├── tsconfig.json
└── README.md
```

## Setup Instructions

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd nodejs-postgres-sequelize
   ```

2. **Install dependencies:**
   ```
   npm install
   ```

3. **Configure the database:**
   Update the `src/config/database.ts` file with your PostgreSQL database credentials.

4. **Run the application:**
   ```
   npm start
   ```

## Usage

- **Get all users:**
  - Endpoint: `GET /users`
  
- **Get user by ID:**
  - Endpoint: `GET /users/:id`

## Dependencies

- `express`: Web framework for Node.js
- `sequelize`: Promise-based Node.js ORM for PostgreSQL
- `pg`: PostgreSQL client for Node.js

## License

This project is licensed under the MIT License.