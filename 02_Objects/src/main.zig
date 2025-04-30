const std = @import("std");
const stdout = std.io.getStdOut().writer();
// const stdout = std.io.getStdOut;

pub fn main() !void {
    const age = 25; //this is immutable
    // want some errors ? try this !
    // age = 24;
    try stdout.print("age = {} \n", .{age});

    var birth_year: u32 = 1945; //this is mutable

    birth_year = 1984;
    try stdout.print("birth year is : {}\n", .{birth_year});

    var num: u8 = undefined; // undefined shall not be used , it can cause undefined problems !
    num = 8;

    // every object that is defined , shall be used
    const nummer = 22;
    _ = nummer; //this means it shall be discarded.
    //nummer does not exist anymore !

    // a var shall always be mutated, otherwise it shall be a const
    // var where_I_live = "127.0.0.1";
    // std.debug.print("{} is a var", .{where_I_live});

    // data types :
    // unsigned integers : u8 u16 u32 u64 u128
    // signed untegers : i8 i16 i32 i64 i128
    // float numbers : f16 f32 f64 f128
    // Boolean : bool
    // C ABI compatible types: c_long, c_char, c_short, c_ushort, c_int, c_uint, and many others.
    // Pointer sized integers: isize and usize.

    // Arrays :
    const ns = [4]u8{ 48, 22, 73, 14 }; // 4 elenments, type: u8
    const ls = [_]f16{ 14.2, 17.3, 55.6 }; // let the compiler count !
    // arrays are static
    _ = ls;
    // you can also call a slice of an array
    const sn = ns[0..2];
    _ = sn;

    try stdout.print("{d}\n", .{ns[2]});

    // array operators :
    // these only work while using compile time known arrays
    const a = [_]u8{ 1, 2, 3 };
    const b = [_]u8{ 4, 5, 6 };
    const c = a ++ b; //concatination operator
    const d = a ** 5; //multipication operator
    try stdout.print("{any}\n", .{c});
    try stdout.print("{any} \n", .{d});

    // Labelled blocks

    var y: i32 = 123;
    const x = add_one: { //we gave a label to this block
        y += 1;
        break :add_one y; // by using break followed by the label, we can return a value from this block
    };

    if (x == 124 and y == 124) {
        try stdout.print("Hey , it worked !\n", .{});
    }

    // Strings
    //strings in Zig are actually arrays !
    const string_object = "An example string in Zig"; // this is an array made of u8 !

    try stdout.print("{d}\n", .{string_object.len}); // it has a length , it's an array , it's safe.
    // and even more clarification ...
    const bytes = [_]u8{ 0x48, 0x65, 0x6C, 0x6C, 0x6F }; // i.e. {H,e,l,l,o}

    try stdout.print("bytes = {s}\n", .{bytes}); // bytes - Hello

    // sentinel-terminated arrays
    _ = "A Literal Value";
    try stdout.print("{any}\n", .{@TypeOf("A Literal Value")});
    //in simple words , this helps Zig find the end of an array , without needing len

    // A string can also be iterpreted as slices !
    const str: []const u8 = "hello world !";
    try stdout.print("{any}\n", .{@TypeOf(str)});

    // Iterating through a string
    const iter_str = "example text for iteration";
    try stdout.print("Bytes that represent the string :", .{});
    for (iter_str) |byte| {
        try stdout.print("{X} ", .{byte});
    }
}
