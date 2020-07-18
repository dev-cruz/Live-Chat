# LiveChat

A live chat based on whatsapp web interface and built with Phoenix Framework.

## Setup:

  First, you need to copy your `.env.example` into a `.env` file, and then, populate your env vars.  

  ```bash
  $ source .env
  $ mix deps.get
  $ mix ecto.setup
  $ cd assets/ && npm install && cd ..
  $ mix phx.server   
  ```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
