pub export fn entry1() void {
    var x: u32 = 3;
    _ = &x;
    _ = @shuffle(u32, [_]u32{0}, @as(@Vector(1, u32), @splat(0)), [_]i8{
        if (x > 1) 1 else -1,
    });
}

pub export fn entry2() void {
    var y: ?i8 = -1;
    _ = &y;
    _ = @shuffle(u32, [_]u32{0}, @as(@Vector(1, u32), @splat(0)), [_]i8{
        y orelse 1,
    });
}

// error
//
// :5:15: error: unable to evaluate comptime expression
// :5:13: note: operation is runtime due to this operand
// :4:72: note: '@shuffle' mask must be comptime-known
// :13:11: error: unable to resolve comptime value
// :12:72: note: '@shuffle' mask must be comptime-known
