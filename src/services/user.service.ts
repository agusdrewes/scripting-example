import User from "../sequelize/models/user.model";

export class UserService {
	async getAllUsers() {
		return await User.findAll();
	}

	async getUserById(id: string) {
		return await User.findByPk(id);
	}
}
