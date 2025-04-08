import express from "express";
import sequelize from "./sequelize/db";
import bodyParser from "body-parser";
import UserController from "./controllers/user.controller";
import { UserService } from "./services/user.service";

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

sequelize
	.authenticate()
	.then(() => {
		console.log("Database connection has been established successfully.");
	})
	.catch((err) => {
		console.error("Unable to connect to the database:", err);
	});

const userController = new UserController(new UserService());

app.use(bodyParser.json());

app.get("/api/users/", userController.getAllUsers);
app.get("/api/users/:id", userController.getUserById);
app.get("/api/hello", (req, res) => {
	res.status(200).json({ message: "Hello, world!" });
});

app.listen(PORT, () => {
	console.log(`Server is running on port ${PORT}`);
});
