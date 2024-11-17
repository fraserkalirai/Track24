defmodule Track24AssesmentWeb.MainPageLive do
  use Phoenix.LiveView

  import Track24AssesmentWeb.Molecules

  alias Track24Assesment.Struct.Trip

  @impl true
  def mount(_params, _, socket) do

    trips = Trip.generate_default_trips()
    selected_trip = Enum.find(trips, fn trip -> trip.name == "Trip Delta" end)

    {
      :ok,
      socket
      |> assign(:trips, trips)
      |> assign(:selected_trip, selected_trip)
      |> assign(:use_modal, false)
    }
  end

  @impl true
  def handle_event("select_trip", %{"name" => name}, socket) do
    selected_trip = Enum.find(socket.assigns.trips, fn trip -> trip.name == name end)
    {
      :noreply,
      socket
      |> assign(:selected_trip, selected_trip)
    }
  end
  def handle_event("close_overview", _params, socket) do
    {
      :noreply,
      socket
      |> assign(:selected_trip, %{name: nil})
    }
  end
  def handle_event("add", _params, socket) do
    {
      :noreply,
      socket
      |> assign(:use_modal, true)
    }
  end
  def handle_event("canel_add", _params, socket) do
    {
      :noreply,
      socket
      |> assign(:use_modal, false)
    }
  end

  defp fetch_travelling_size(travelling) do
    Enum.reduce(travelling, 0, fn {_, _, count}, acc ->
      acc + count
    end)
  end

end
