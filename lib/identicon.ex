defmodule Identicon do
@doc """
Main function which in order step by step executes every funtcion in project.
"""
  def main(input) do
    input
    |>hash_input
    |>pick_color
    |>build_grid
    |>filter_odd_squares
    |>build_pixel_map
    |>draw_image
    |>save_image(input)
  end

  @doc """
  Aaccepts string and convert it to hexadecimal number system.

## Examples

        iex> input = "banana"
        iex> Identicon.hash_input(input)
        %Identicon.Image{
        color: nil,
        grid: nil,
        hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
        pixel_map: nil
        }

"""
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
  @doc """
  Function that selects first three numbers from map and set this numbers to color value

  ## Examples
        iex> image = Identicon.hash_input("banana")
        %Identicon.Image{
        color: nil,
        grid: nil,
        hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
        pixel_map: nil
        }
        iex>Identicon.pick_color(image)
        %Identicon.Image{
        color: {114, 179, 2},
        grid: nil,
        hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
        pixel_map: nil
        }

  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail ]} = image) do
  %Identicon.Image{image | color: {r, g, b}}
end
@doc """
Function which takes numbers from map separates it in 3 numbers in one list, next puts in single list, first two numbers as mirror reflection and flats all list to single list.
At the end gives every number from list its own index number.

## Examples

      iex> image = Identicon.hash_input("banana")
      %Identicon.Image{
      color: nil,
      grid: nil,
      hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
      pixel_map: nil
      }
      iex> Identicon.build_grid(image)
      %Identicon.Image{
      color: nil,
      grid: [{114, 0}, {179, 1}, {2, 2}, {179, 3}, {114, 4},
      {191, 5}, {41, 6}, {122, 7}, {41, 8}, {191, 9},
      {34, 10}, {138, 11}, {117, 12}, {138, 13}, {34, 14},
      {115, 15}, {1, 16}, {35, 17}, {1, 18}, {115, 19},
      {239, 20}, {239, 21}, {124, 22}, {239, 23}, {239, 24}
      ],
      hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
      pixel_map: nil
      }
"""
def build_grid(%Identicon.Image{hex: hex} = image) do
  grid =
      hex
      |>Enum.chunk(3)
      |>Enum.map(&mirror_row/1)
      |>List.flatten
      |>Enum.with_index
  %Identicon.Image{image | grid: grid}
end

def mirror_row(row) do
  [first, second | _tail] = row
  row ++  [second, first]
end
@doc """
Function that deletes from grid all odd numbers

## Exmple

       iex> image = Identicon.hash_input("banana")
       %Identicon.Image{
       color: nil,
       grid: nil,
       hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
       pixel_map: nil
       }
       iex>grid = Identicon.build_grid(image)
       %Identicon.Image{
       color: nil,
       grid: [{114, 0}, {179, 1}, {2, 2}, {179, 3}, {114, 4},
       {191, 5}, {41, 6}, {122, 7}, {41, 8}, {191, 9},
       {34, 10}, {138, 11}, {117, 12}, {138, 13}, {34, 14},
       {115, 15}, {1, 16}, {35, 17}, {1, 18}, {115, 19},
       {239, 20}, {239, 21}, {124, 22}, {239, 23}, {239, 24}
       ],
       hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
       pixel_map: nil
       }
       iex> Identicon.filter_odd_squares(grid)
       %Identicon.Image{
       color: nil,
       grid: [{114, 0}, {2, 2}, {114, 4}, {122, 7},
       {34, 10}, {138, 11}, {138, 13}, {34, 14}, {124, 22}],
       hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
       pixel_map: nil
       }

"""
def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
      grid = Enum.filter grid, fn({code, _index}) ->
        rem(code, 2) == 0
  end
  %Identicon.Image{image | grid: grid}
end
@doc """
Using numers from grid generates co-ordinates for even squares and put it in pixel_map list

## Examples

      iex>image = Identicon.hash_input("banana")
      %Identicon.Image{
      color: nil,
      grid: nil,
      hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
      pixel_map: nil
      }
      iex>grid = Identicon.build_grid(image)
      %Identicon.Image{
      color: nil,
      grid: [{114, 0}, {179, 1}, {2, 2}, {179, 3}, {114, 4},
      {191, 5}, {41, 6}, {122, 7}, {41, 8}, {191, 9},
      {34, 10}, {138, 11}, {117, 12}, {138, 13}, {34, 14},
      {115, 15}, {1, 16}, {35, 17}, {1, 18}, {115, 19},
      {239, 20}, {239, 21}, {124, 22}, {239, 23}, {239, 24}
      ],
      hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
      pixel_map: nil
      }
      iex>no_odd_squares = Identicon.filter_odd_squares(grid)
      %Identicon.Image{
      color: nil,
      grid: [{114, 0}, {2, 2}, {114, 4}, {122, 7},
      {34, 10}, {138, 11}, {138, 13}, {34, 14}, {124, 22}],
      hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
      pixel_map: nil
      }
      iex>Identicon.build_pixel_map(no_odd_squares)
      %Identicon.Image{
      color: nil,
      grid: [{114, 0}, {2, 2}, {114, 4}, {122, 7},
      {34, 10}, {138, 11}, {138, 13}, {34, 14}, {124, 22}],
      hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
      pixel_map: [
      {{0, 0}, {50, 50}},
      {{100, 0}, {150, 50}},
      {{200, 0}, {250, 50}},
      {{100, 50}, {150, 100}},
      {{0, 100}, {50, 150}},
      {{50, 100}, {100, 150}},
      {{150, 100}, {200, 150}},
      {{200, 100}, {250, 150}},
      {{100, 200}, {150, 250}}]
      }

"""
def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end

    %Identicon.Image{image | pixel_map: pixel_map}
  end
@doc """
Function that drwas image
"""

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)

    Enum.each pixel_map, fn({start,stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end
    :egd.render(image)
  end
  @doc """
Function that saves identicon to file in png format
"""
  def save_image(image, input) do
    File.write("#{input}.png", image)
  end
end
