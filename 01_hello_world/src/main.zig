const std = @import("std");

pub fn main() !void { // ! means that this little guy might return an error
    // void means this fn is allowed to return nothing. 
    const stdout = std.io.getStdOut().writer();
    try stdout.print ("Hello, {s} ! \n", .{"World"});
}

