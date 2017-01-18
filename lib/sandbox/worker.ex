defmodule Sandbox.Worker do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def say_hello(pid, name \\ "World") do
    GenServer.call(pid, {:name, name})
  end

  def handle_call({:name, name}, _from, state) do
    {:reply, "Hello, #{name}!", state}
  end
end
