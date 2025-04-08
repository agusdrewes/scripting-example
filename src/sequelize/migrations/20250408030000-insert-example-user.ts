import { QueryInterface } from "sequelize";

export default {
  up: async (queryInterface: QueryInterface) => {
    await queryInterface.bulkInsert("users", [
      {
        name: "Lionel",
        last_name: "Messi",
        birthdate: "1987-06-24",
        createdAt: new Date(),
        updatedAt: new Date(),
      },
    ]);
  },

  down: async (queryInterface: QueryInterface) => {
    await queryInterface.bulkDelete("users", { name: "John", last_name: "Doe" });
  },
};