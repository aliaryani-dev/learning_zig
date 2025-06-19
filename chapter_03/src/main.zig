const std = @import("std");
const stdout = std.io.getStdOut().writer();
const Role = enum { SE, DPE, DE, DA, PM, PO, KS };


fn defer_fn() !void {
    defer std.debug.print ("exiting funcion ...\n", .{});
    //? defer will be executed at the end of the scope.
    try stdout.print ("Adding stuff ...\n", .{});
    const x: u8 = 2 + 2; _ = x;
    try stdout.print ("Multiplying stuff ...\n", .{});
    const y: u8 = 2 * 2; _ = y;
}

fn errdiffer_fn() !void {
    var i: usize = 1;
    std.debug.print ("Value of i : {d}\n", .{i});
    defer i = 2;
    try errrdiffer();
}

fn errrdiffer () !void {
    return error.FooError;
}

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
        // 3 => return,
        4 => {},
        else => {
            try stdout.print("Unmatched case {d}\n", .{@as(u8, 1)});
        },
    }

    //? `differ` keyword
    try defer_fn();

    // ? `errdiffer` 
    // errdiffer_fn()
    // I got some errors, simply this executes when an error occurs.
    
    //? `for` loops

    const name = [_]u8{'H','a','n','n','i','b','a','l'};
    for (name) |value| {
        try stdout.print ("{d} |", .{value});
    }

    const name2 = "Ali";
    for (name2, 0..) |character, i| {
        try stdout.print ("{any} - {d}\n", .{character , i});
    }

    //? `while` loops
    var while_count: u8 = 5;
    while (while_count>0){
        try stdout.print("{d}\n", .{while_count});
        while_count -= 1;
    }
    // zig is more interesting than that !
    while (while_count < 5) : (while_count += 1) {
        try stdout.print ("{d}\n", .{while_count});
    }

    //? using `break` and `continue`
    var the_counter: u8 = 1;
    while (true) {
        if (the_counter == 10) {
            break;
        }
        the_counter += 1;
    }
    try std.testing.expect (the_counter == 10);
    try stdout.print ("Everything worked here !\n", .{});
    // `continue is used so that one iteration is skipped.
}
