const std = @import ("std");
const stdin = std.io.getStdIn();

pub fn main () !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var input = allocator.alloc (u8, 50);
    defer allocator.free (input);
    for (0..input.len) |i| {
        input[i] = 0;
    }

    // read user input
    const reader = stdin.reader();
    _ = try reader.readUntilDelimiterOrEof (input, '\n');

    std.debug.print ("{s}\n", .{input});

}