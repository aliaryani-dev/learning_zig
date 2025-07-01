const std = @import ("std");
const arena = @import ("arena");

fn input_length(input: []const u8) usize {
    // input here is //* known at run time
    const u = input.len;
    // u is a usize and it's size is //* known at compile time
    return u;
}

pub fn main() !void {
    // name and array here are //* known at compile time
    const name = "Ali";
    const array = [_]u8{ 1, 2, 3, 4 };
    _ = name;
    _ = array;
    //? General purpose is a general purpose allocator. it can be used for any type of task.
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const some_number = try allocator.create (u32);
    defer allocator.destroy (some_number);
    
    arena.arena_alloc();

    some_number.* = @as (u32, 45);
}
