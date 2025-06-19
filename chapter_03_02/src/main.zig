const std = @import ("std");
// const stdout = std.io.getStdOut().writer();


fn add2(x: u32) u32 {
    x = x + 2; // function parameters are immutable, this will raise an error !
    return x;
}

fn add3(x: *u32) void {
    const d: u32 = 3; 
    x.* = x.* + d; //* Let's use a pointer !
}

pub fn main() !void {
    // const y = add2 (4);
    var y: u32 = 3;
    add3 (&y);
    std.debug.print ("{d}\n", .{y});
}