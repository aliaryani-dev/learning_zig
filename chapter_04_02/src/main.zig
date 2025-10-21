const std = @import ("std");
var stdin_buffer:[1024]u8 = undefined;
var stdin_writer = std.fs.File.stdin().reader(&stdin_buffer);
const stdin = &stdin_writer.interface;

pub fn main () !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var input = try allocator.alloc (u8, 50);
    defer allocator.free (input);
    @memset(input[0..], 0);

    // read user input
    stdin.readSliceAll(input[0..]) catch |err| switch (err) {
        error.EndOfStream => {},
        else => return err,
    };

    std.debug.print ("{s}\n", .{input});

}
