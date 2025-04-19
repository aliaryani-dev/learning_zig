const std = @import("std");

pub fn main() !void {
    const age = 25; //this is immutable
    // want some errors ? try this !
    // age = 24;
    std.debug.print("age = {} \n", .{age});

    var birth_year: u32 = 1945; //this is mutable

    birth_year = 1984;
    std.debug.print("birth year is : {}\n", .{birth_year});

    var num: u8 = undefined; // undefined shall not be used , it can cause undefined problems !
    num = 8;

    // every object that is defined , shall be used
    const nummer = 22;
    _ = nummer; //this means it shall be discarded.
    //nummer does not exist anymore !

    // a var shall always be mutated, otherwise it shall be a const
    // var where_I_live = "127.0.0.1";
    // std.debug.print("{} is a var", .{where_I_live});
}
