import { Request, Response } from "express";
import { UserService } from "../services/user.service";

class UserController {
	private userService: UserService;

	constructor(userService: UserService) {
		this.userService = userService;
	}

	getAllUsers = async (req: Request, res: Response) => {
		try {
			const users = await this.userService.getAllUsers();
			res.status(200).json(users);
		} catch (error) {
			res.status(500).json({ message: "Error retrieving users", error });
		}
	};

	getUserById = async (req: Request, res: Response) => {
		const userId = req.params.id;
		try {
			const user = await this.userService.getUserById(userId);
			if (user) {
				res.status(200).json(user);
			} else {
				res.status(404).json({ message: "User not found" });
			}
		} catch (error) {
			res.status(500).json({ message: "Error retrieving user", error });
		}
	};
}

export default UserController;
