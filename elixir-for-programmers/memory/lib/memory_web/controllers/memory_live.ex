defmodule MemoryWeb.MemoryLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <table>
    <%= for { name, value } <-  assigns.memory do %>
      <tr>
        <th><%= name %></th>
        <td><%= value %></td>
      </tr>
      <% end %>
    </table>
    """
  end

  def mount(_params, _session, socket) do
    { :ok, schedule_tick_and_update_assign(socket) }
  end

  def handle_info(msg, socket) do
    { :noreply, schedule_tick_and_update_assign(socket) }
  end

  defp schedule_tick_and_update_assign(socket) do
    Process.send_after(self(), :tick, 1000)
    assign(socket, :memory, :erlang.memory())
  end
end
