const std = @import("std");
// const expect = std.testing.expect;

//test "testing simple sum" {
 //   const a:u8 = 2;
 //   const b:u8 = 2;

//    try expect((a + b) == 4);
//}
//
const Allocator = std.mem.Allocator;
fn some_memory_leak(allocator: Allocator) !void {
    const buffer = try allocator.alloc(u32, 10);
    _ = buffer;
    // no freeing happened here
}

test "memory leak" {
    const allocator = std.testing.allocator;
    try some_memory_leak(allocator); // ERROR: 1 tests leaked memory
}

