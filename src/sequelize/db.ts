import { Sequelize } from "sequelize";

const dbConn = "postgres://test_user:test_password@localhost:5432/postgres";

const maxPoolConnections = 10;
const minPoolConnections = 10;
const acquire = 10;
const idle = 10;

const sequelize = new Sequelize(dbConn, {
	logging: true,
	pool: {
		max: maxPoolConnections,
		min: minPoolConnections,
		acquire: acquire,
		idle: idle,
	},
});

export default sequelize;
