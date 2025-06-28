const std = @import("std");
const expect = std.testing.expect;
test {
    const x: usize = 500;
    const y = @as(u32, x);
    try expect(@TypeOf(y) == u32);
}
