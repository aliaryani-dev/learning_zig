const std = @import("std");
const stdout = std.io.getStdOut().writer();
const user = @import("user.zig");
const m = std.math;

//structs
const User = struct {
    id: u64,
    name: []const u8,
    email: []const u8,
    fn init(id: u64, name: []const u8, email: []const u8) User {
        return User{ .id = id, .name = name, .email = email };
    }

    fn print_name(self: User) !void {
        try stdout.print("user's name: {s}\n", .{self.name});
    }
};

const Vec3 = struct {
    x: f64,
    y: f64,
    z: f64,
    pub fn distance(self: Vec3, other: Vec3) f64 {
        const xd = m.pow(f64, self.x - other.x, 2.0);
        const yd = m.pow(f64, self.y - other.y, 2.0);
        const zd = m.pow(f64, self.z - other.z, 2.0);

        return m.sqrt(xd + yd + zd);
    }

    // if the function we create here is supposed to change stuff, we will need to use pointers
    pub fn twice(self: *Vec3) void {
        self.x = self.x * 2.0;
        self.y = self.y * 2.0;
        self.z = self.z * 2.0;
    }
};
//? structs must be const, they cannot be var

pub fn main() !void {
    const u: User = User.init(1, "Ali", "ali@proton.me");
    const uii: user.User_II = undefined; // this will fail as User_II is not public.
    _ = uii;
    try u.print_name();
    const eu = User{ .email = "teset@test.t", .id = 2, .name = "testy" };
    try eu.print_name();

    const v1 = Vec3{ .x = 2.4, .y = 4.2, .z = 0.9 };
    const v2 = Vec3{ .x = 5.1, .y = 5.6, .z = 1.6 };
    try stdout.print("Distance: {d}\n", .{v1.distance(v2)});

    //? for the new method to work, we need a var not a const
    var v3 = Vec3{ .x = 1.2, .y = 2.6, .z = 5.7 };
    try stdout.print("v3 Old distance: {d}\n", .{v3.distance(v2)});
    v3.twice();
    try stdout.print("New distance: {d}\n", .{v3.distance(v2)});
}
