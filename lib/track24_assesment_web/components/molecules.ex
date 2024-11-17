defmodule Track24AssesmentWeb.Molecules do

  def trip_class(false) do
    "flex flex-row border-t border-track24-neutral-40 items-center h-[48px] hover:bg-track24-neutral-10 bg-track24-neutral-0 leading-5 font-normal text-[14px] text-track24-neutral-800 w-full"
  end
  def trip_class(true) do
    "flex flex-row border-t border-track24-neutral-40 items-center h-[48px] bg-track24-neutral-20 leading-5 font-normal text-[14px] text-track24-neutral-800 w-full"
  end

end
