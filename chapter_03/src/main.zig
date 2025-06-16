const std = @import("std");
const stdout = std.io.getStdOut().writer();
const Role = enum { SE, DPE, DE, DA, PM, PO, KS };

pub fn main() !void {
    //* Control Flow
    //? If/else statements
    const x = 15;
    if (x > 17) {
        try stdout.print("x > 17!\n", .{});
    } else {
        try stdout.print("x < 17!\n", .{});
    }

    //? switch statements
    var area: []const u8 = undefined;
    const role = Role.SE;
    switch (role) {
        .PM, .SE, .DPE, .PO => {
            area = "Platform";
        },
        .DE, .DA => {
            area = "Data & Analysis";
        },
        .KS => {
            area = "Sales";
        },
    }
    try stdout.print("area : {s}\n", .{area});
    // switch statements must exhaust all existing posibilities
    // you can use an `else` branch to handle the remaining possibalities and/or unexpected errors
    const level: u8 = 4;
    const category = switch (level) {
        1, 2 => "beginner",
        3 => "professional",
        else => {
            // @panic("Not supported level !");
            try stdout.print("Panics here !\n", .{});
        },
    };
    try stdout.print("Category: {any}\n", .{category});
    //you can also use `...` to define ranges in a switch. e.g. 0...25 => "beginner"
    // this works with characters too. e.g. 'a'...'z'

    // labels also exist here in switches
    xsw: switch (@as(u8, 1)) {
        1 => {
            try stdout.print("First Branch\n", .{});
            continue :xsw 2;
        },
        2 => continue :xsw 3,
        3 => return,
        4 => {},
        else => {
            try stdout.print("Unmatched case {d}\n", .{@as(u8, 1)});
        },
    }

    //? `differ` keyword
}
