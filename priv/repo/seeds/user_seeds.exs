
  alias ElixirJson.Repo
  alias ElixirJson.Chat.User

  Repo.insert! %User{
      firstname: "John",
      lastname: "Doe",
      email: "john@gmail.com",
  }

 
  Repo.insert! %User{
      firstname: "Ninja",
      lastname: "Mark",
      email: "ninja@gmail.com",
  }

  Repo.insert! %User{
      firstname: "Sam",
      lastname: "Smith",
      email: "sam@gmail.com",
  }
