
# Phoenix Authentication Setup

## 1. Update Config and Test for Database

Before generating authentication, ensure your database configuration is properly set up:

1. Update `config/dev.exs` and `config/test.exs` with your database credentials:

   
   config :your_app, YourApp.Repo,
     username: "your_username",
     password: "your_password",
     database: "your_app_dev",
     hostname: "localhost",
     show_sensitive_data_on_connection_error: true,
     pool_size: 10
   

2. Run the following commands to create and migrate your database:

   
   mix ecto.create
   mix ecto.migrate
   

3. Ensure your tests are passing:

   
   mix test
   

## 2. Generate Authentication

Now that your database is set up, generate the authentication system:


mix phx.gen.auth Accounts User users


This command will:
- Create an `Accounts` context
- Generate a `User` schema
- Create a `users` table in the database

## 3. Follow Post-Generation Instructions

After running the generator, follow the instructions provided in the terminal:

1. Add the authentication routes to your `router.ex` file
2. Add the `:accounts` context to your supervision tree in `application.ex`
3. Run migrations to create the new `users` table:

   
   mix ecto.setup

4. Update your `config/test.exs` to use the new authentication system in tests

## 4. Customize as Needed

You can now customize the generated authentication system to fit your specific needs:

- Modify the `User` schema in `lib/your_app/accounts/user.ex`
- Adjust the authentication logic in `lib/your_app/accounts.ex`
- Customize the generated templates in `lib/your_app_web/templates/user_*`

Remember to run your tests frequently to ensure your changes don't break existing functionality.

Happy coding! 🚀
