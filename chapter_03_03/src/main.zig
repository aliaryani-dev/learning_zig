const std = @import ("std");
const stdout = std.io.getStdOut().writer();

//structs
const User = struct {
    id: u64
    , name: []const u8
    , email: []const u8

    , fn init (
        id: u64
        , name: []const u8
        , email: []const u8
    ) User {
        return User {
            .id = id
            , .name = name
            , .email = email
        };
    }

    fn print_name (self: User) !void {
        try stdout.print ("user's name: {s}\n", .{self.name});
    }
};

pub fn main() !void {
    const u: User = User.init (1, "Ali", "lenesis@proton.me");
    try u.print_name();
}