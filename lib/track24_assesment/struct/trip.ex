defmodule Track24Assesment.Struct.Trip do

  @one_profile [{:user, "Profile name", 1}]
  @three_profiles [{:user, "Philp Burn", 1}, {:tracker, "Tracker Delta", 1}, {:vehicle, "Vehicle Charlie", 1}]
  @six_profiles [{:user, "Philp Burn", 1}, {:group, "Group Bravo", 3}, {:tracker, "Tracker Delta", 1}, {:vehicle, "Vehicle Charlie", 1}]
  @default_description "Here’s the description of the trip, wherever this comes from. It may be optional?"

  defstruct [
    :name,
    :description,
    :start,
    :end,
    :travelling,
    :status,
    :issues,
    :breakdown
  ]

  @type t() :: %__MODULE__{
    name:         String.t(),
    description:  String.t(),
    start:        Date.t() | nil,
    end:          Date.t() | nil,
    travelling:   [tuple()],
    status:       atom(),
    issues:       [String.t()],
    breakdown:    list()
  }

  def create(name, start_date, end_date, travelling, status, issues, description \\ @default_description) do
    %__MODULE__{
      name:   name,
      start: start_date,
      end:  end_date,
      travelling: travelling,
      status: status,
      issues: issues,
      description: description,
      breakdown: [
        [
          {:location, "Brixton station, London"}
        ],
        [
          {:location, "Battersea park hotel, London"},
          {:datetime, "Today: 8:30"},
          {:vehicle, "Car"},
          {:arrived, "6 of 6 arrived"}
        ],
        [
          {:issue, "Philp Burn is overdue"},
          {:location, "Adeldale House, London"}
        ],
        [
          {:location, "Surrey Docks Health Centre, London"}
        ]
      ]
    }
  end

  @spec generate_default_trips() :: [t()]
  def generate_default_trips() do
    [
      create("Unkown journey...", ~D[2024-08-12], nil, @one_profile, :in_progress, []),
      create("Trip Bravo", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :not_started, ["Nearby", "Nearby"]),
      create("Trip Charlie", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :not_started, []),
      create("Trip Delta", ~D[2024-08-12], ~D[2024-08-13], @six_profiles, :in_progress, ["Overdue"]),
      create("Trip Echo", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :in_progress, []),
      create("Trip Foxtrot", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :completed, []),
      create("Trip Golf", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :completed, []),
      create("Trip Hotel", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :completed, []),
      create("Trip India", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :completed, []),
      create("Trip Juliet", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :cancelled, []),
      create("Trip Kilo", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :completed, []),
      create("Trip Lima", ~D[2024-08-12], ~D[2024-08-13], @three_profiles, :completed, [])
    ]
  end

end
