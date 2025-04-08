import { Model, DataTypes } from "sequelize";
import sequelize from "../db";

class User extends Model {
	public id!: number;
	public name!: string;
	public last_name!: string;
	public birthdate!: Date;
}

User.init(
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		name: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		last_name: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		birthdate: {
			type: DataTypes.STRING,
			allowNull: false,
		},
	},
	{
		sequelize,
		tableName: "users",
	}
);

export default User;
