const std = @import("std");

pub fn arena_alloc () !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var aa = std.heap.ArenaAllocator.init (gpa.allocator());
    //? Arena allocator allows you to simply deallocate all allocated memory using deinit
    defer aa.deinit();
    const allocator = aa.allocator();

    const n1 = try allocator.alloc (u8, 5);
    const n2 = try allocator.alloc (u8, 10);
    const n3 = try allocator.alloc (u8, 15);

    _ = n1;
    _ = n2;
    _ = n3;
}