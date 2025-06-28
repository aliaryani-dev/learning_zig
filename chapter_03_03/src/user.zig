const std = @import ("std");
const stdout = std.io.getStdOut().writer();

// const User_II = struct {
// let's make this struct public !
pub const User_II = struct {
    id: u64
    , name: []const u8
    , email: []const u8
    // making struct public will not make it's functions public. we need to make them public.
    , pub fn init (
        id: u64
        , name: []const u8
        , email: []const u8
    ) User_II {
        return User_II {
            .id = id
            , .name = name
            , .email = email
        };
    }

    pub fn print_name (self: User_II) !void {
        try stdout.print ("user's name: {s}\n", .{self.name});
    }
};