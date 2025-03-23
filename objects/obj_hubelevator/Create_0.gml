var i, c;

depth = 10;
state = States.frozen;
i = 0;
hub_array[i++] = [hub_w4, "THE END"];
hub_array[i++] = [hub_w3, "THE CHAMBER"];
hub_array[i++] = [hub_w2, "THE SEWERS"];
hub_array[i++] = [hub_w1, "THE SHOWROOM"];
drawx = 0;
drawy = 0;
surface2 = -4;
yoffset = 0;
ScrollY = 0;
playerID = -4;
selected = 0;

for (c = 1; c < array_length(hub_array); c++)
{
    if (room == hub_array[c][0])
    {
        selected = c;
        break;
    }
}

image_index = selected;

