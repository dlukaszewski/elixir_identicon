searchNodes=[{"doc":"","ref":"Identicon.html","title":"Identicon","type":"module"},{"doc":"Function which takes numbers from map separates it in 3 numbers in one list, next puts in single list, first two numbers as mirror reflection and flats all list to single list. At the end gives every number from list its own index number.Examples iex&gt; image = Identicon.hash_input(&quot;banana&quot;) %Identicon.Image{ color: nil, grid: nil, hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil } iex&gt; Identicon.build_grid(image) %Identicon.Image{ color: nil, grid: [{114, 0}, {179, 1}, {2, 2}, {179, 3}, {114, 4}, {191, 5}, {41, 6}, {122, 7}, {41, 8}, {191, 9}, {34, 10}, {138, 11}, {117, 12}, {138, 13}, {34, 14}, {115, 15}, {1, 16}, {35, 17}, {1, 18}, {115, 19}, {239, 20}, {239, 21}, {124, 22}, {239, 23}, {239, 24} ], hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil }","ref":"Identicon.html#build_grid/1","title":"Identicon.build_grid/1","type":"function"},{"doc":"Using numers from grid generates co-ordinates for even squares and put it in pixel_map listExamples iex&gt;image = Identicon.hash_input(&quot;banana&quot;) %Identicon.Image{ color: nil, grid: nil, hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil } iex&gt;grid = Identicon.build_grid(image) %Identicon.Image{ color: nil, grid: [{114, 0}, {179, 1}, {2, 2}, {179, 3}, {114, 4}, {191, 5}, {41, 6}, {122, 7}, {41, 8}, {191, 9}, {34, 10}, {138, 11}, {117, 12}, {138, 13}, {34, 14}, {115, 15}, {1, 16}, {35, 17}, {1, 18}, {115, 19}, {239, 20}, {239, 21}, {124, 22}, {239, 23}, {239, 24} ], hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil } iex&gt;no_odd_squares = Identicon.filter_odd_squares(grid) %Identicon.Image{ color: nil, grid: [{114, 0}, {2, 2}, {114, 4}, {122, 7}, {34, 10}, {138, 11}, {138, 13}, {34, 14}, {124, 22}], hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil } iex&gt;Identicon.build_pixel_map(no_odd_squares) %Identicon.Image{ color: nil, grid: [{114, 0}, {2, 2}, {114, 4}, {122, 7}, {34, 10}, {138, 11}, {138, 13}, {34, 14}, {124, 22}], hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: [ {{0, 0}, {50, 50}}, {{100, 0}, {150, 50}}, {{200, 0}, {250, 50}}, {{100, 50}, {150, 100}}, {{0, 100}, {50, 150}}, {{50, 100}, {100, 150}}, {{150, 100}, {200, 150}}, {{200, 100}, {250, 150}}, {{100, 200}, {150, 250}}] }","ref":"Identicon.html#build_pixel_map/1","title":"Identicon.build_pixel_map/1","type":"function"},{"doc":"Function that drwas image","ref":"Identicon.html#draw_image/1","title":"Identicon.draw_image/1","type":"function"},{"doc":"Function that deletes from grid all odd numbersExmple iex&gt; image = Identicon.hash_input(&quot;banana&quot;) %Identicon.Image{ color: nil, grid: nil, hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil } iex&gt;grid = Identicon.build_grid(image) %Identicon.Image{ color: nil, grid: [{114, 0}, {179, 1}, {2, 2}, {179, 3}, {114, 4}, {191, 5}, {41, 6}, {122, 7}, {41, 8}, {191, 9}, {34, 10}, {138, 11}, {117, 12}, {138, 13}, {34, 14}, {115, 15}, {1, 16}, {35, 17}, {1, 18}, {115, 19}, {239, 20}, {239, 21}, {124, 22}, {239, 23}, {239, 24} ], hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil } iex&gt; Identicon.filter_odd_squares(grid) %Identicon.Image{ color: nil, grid: [{114, 0}, {2, 2}, {114, 4}, {122, 7}, {34, 10}, {138, 11}, {138, 13}, {34, 14}, {124, 22}], hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil }","ref":"Identicon.html#filter_odd_squares/1","title":"Identicon.filter_odd_squares/1","type":"function"},{"doc":"Aaccepts string and convert it to hexadecimal number system.Examples iex&gt; input = &quot;banana&quot; iex&gt; Identicon.hash_input(input) %Identicon.Image{ color: nil, grid: nil, hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil }","ref":"Identicon.html#hash_input/1","title":"Identicon.hash_input/1","type":"function"},{"doc":"Main function which in order step by step executes every funtcion in project.","ref":"Identicon.html#main/1","title":"Identicon.main/1","type":"function"},{"doc":"","ref":"Identicon.html#mirror_row/1","title":"Identicon.mirror_row/1","type":"function"},{"doc":"Function that selects first three numbers from map and set this numbers to color valueExamples iex&gt; image = Identicon.hash_input(&quot;banana&quot;) %Identicon.Image{ color: nil, grid: nil, hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil } iex&gt;Identicon.pick_color(image) %Identicon.Image{ color: {114, 179, 2}, grid: nil, hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65], pixel_map: nil }","ref":"Identicon.html#pick_color/1","title":"Identicon.pick_color/1","type":"function"},{"doc":"Function that saves identicon to file in png format","ref":"Identicon.html#save_image/2","title":"Identicon.save_image/2","type":"function"},{"doc":"","ref":"Identicon.Image.html","title":"Identicon.Image","type":"module"},{"doc":"Struct prepared for Identicon module","ref":"Identicon.Image.html#__struct__/0","title":"Identicon.Image.__struct__/0","type":"function"}]