# Copyright (c) 2013, Kenton Varda <temporal@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

using Cxx = import "c++.capnp";

$Cxx.namespace("capnproto::test");

enum TestEnum {
  foo @0;
  bar @1;
  baz @2;
  qux @3;
  quux @4;
  corge @5;
  grault @6;
  garply @7;
}

struct TestAllTypes {
  voidField      @0  : Void;
  boolField      @1  : Bool;
  int8Field      @2  : Int8;
  int16Field     @3  : Int16;
  int32Field     @4  : Int32;
  int64Field     @5  : Int64;
  uInt8Field     @6  : UInt8;
  uInt16Field    @7  : UInt16;
  uInt32Field    @8  : UInt32;
  uInt64Field    @9  : UInt64;
  float32Field   @10 : Float32;
  float64Field   @11 : Float64;
  textField      @12 : Text;
  dataField      @13 : Data;
  structField    @14 : TestAllTypes;
  enumField      @15 : TestEnum;
  interfaceField @16 : Void;  # TODO

  voidList      @17 : List(Void);
  boolList      @18 : List(Bool);
  int8List      @19 : List(Int8);
  int16List     @20 : List(Int16);
  int32List     @21 : List(Int32);
  int64List     @22 : List(Int64);
  uInt8List     @23 : List(UInt8);
  uInt16List    @24 : List(UInt16);
  uInt32List    @25 : List(UInt32);
  uInt64List    @26 : List(UInt64);
  float32List   @27 : List(Float32);
  float64List   @28 : List(Float64);
  textList      @29 : List(Text);
  dataList      @30 : List(Data);
  structList    @31 : List(TestAllTypes);
  enumList      @32 : List(TestEnum);
  interfaceList @33 : List(Void);  # TODO
}

struct TestDefaults {
  voidField      @0  : Void    = void;
  boolField      @1  : Bool    = true;
  int8Field      @2  : Int8    = -123;
  int16Field     @3  : Int16   = -12345;
  int32Field     @4  : Int32   = -12345678;
  int64Field     @5  : Int64   = -123456789012345;
  uInt8Field     @6  : UInt8   = 234;
  uInt16Field    @7  : UInt16  = 45678;
  uInt32Field    @8  : UInt32  = 3456789012;
  uInt64Field    @9  : UInt64  = 12345678901234567890;
  float32Field   @10 : Float32 = 1234.5;
  float64Field   @11 : Float64 = -123e45;
  textField      @12 : Text    = "foo";
  dataField      @13 : Data    = "bar";
  structField    @14 : TestAllTypes = (
      voidField      = void,
      boolField      = true,
      int8Field      = -12,
      int16Field     = 3456,
      int32Field     = -78901234,
      int64Field     = 56789012345678,
      uInt8Field     = 90,
      uInt16Field    = 1234,
      uInt32Field    = 56789012,
      uInt64Field    = 345678901234567890,
      float32Field   = -1.25e-10,
      float64Field   = 345,
      textField      = "baz",
      dataField      = "qux",
      structField    = (
          textField = "nested",
          structField = (textField = "really nested")),
      enumField      = baz,
      # interfaceField can't have a default

      voidList      = [void, void, void],
      boolList      = [false, true, false, true, true],
      int8List      = [12, -34, -0x80, 0x7f],
      int16List     = [1234, -5678, -0x8000, 0x7fff],
      int32List     = [12345678, -90123456, -0x8000000, 0x7ffffff],
      int64List     = [123456789012345, -678901234567890, -0x8000000000000000, 0x7fffffffffffffff],
      uInt8List     = [12, 34, 0, 0xff],
      uInt16List    = [1234, 5678, 0, 0xffff],
      uInt32List    = [12345678, 90123456, 0, 0xffffffff],
      uInt64List    = [123456789012345, 678901234567890, 0, 0xffffffffffffffff],
      float32List   = [0, 1234567, 1e37, -1e37, 1e-37, -1e-37],
      float64List   = [0, 123456789012345, 1e306, -1e306, 1e-306, -1e-306],
      textList      = ["quux", "corge", "grault"],
      dataList      = ["garply", "waldo", "fred"],
      structList    = [
          (textField = "x structlist 1"),
          (textField = "x structlist 2"),
          (textField = "x structlist 3")],
      enumList      = [qux, bar, grault]
      # interfaceList can't have a default
      );
  enumField      @15 : TestEnum = corge;
  interfaceField @16 : Void;  # TODO

  voidList      @17 : List(Void)    = [void, void, void, void, void, void];
  boolList      @18 : List(Bool)    = [true, false, false, true];
  int8List      @19 : List(Int8)    = [111, -111];
  int16List     @20 : List(Int16)   = [11111, -11111];
  int32List     @21 : List(Int32)   = [111111111, -111111111];
  int64List     @22 : List(Int64)   = [1111111111111111111, -1111111111111111111];
  uInt8List     @23 : List(UInt8)   = [111, 222] ;
  uInt16List    @24 : List(UInt16)  = [33333, 44444];
  uInt32List    @25 : List(UInt32)  = [3333333333];
  uInt64List    @26 : List(UInt64)  = [11111111111111111111];
  float32List   @27 : List(Float32) = [5555.5, inf, -inf, nan];
  float64List   @28 : List(Float64) = [7777.75, inf, -inf, nan];
  textList      @29 : List(Text)    = ["plugh", "xyzzy", "thud"];
  dataList      @30 : List(Data)    = ["oops", "exhausted", "rfc3092"];
  structList    @31 : List(TestAllTypes) = [
      (textField = "structlist 1"),
      (textField = "structlist 2"),
      (textField = "structlist 3")];
  enumList      @32 : List(TestEnum) = [foo, garply];
  interfaceList @33 : List(Void);  # TODO
}

struct TestUnion {
  union0 @0 union {
    # Pack union 0 under ideal conditions: there is no unused padding space prior to it.
    u0f0s0  @4: Void;
    u0f0s1  @5: Bool;
    u0f0s8  @6: Int8;
    u0f0s16 @7: Int16;
    u0f0s32 @8: Int32;
    u0f0s64 @9: Int64;
    u0f0sp  @10: Text;

    # Pack more stuff into union0 -- should go in same space.
    u0f1s0  @11: Void;
    u0f1s1  @12: Bool;
    u0f1s8  @13: Int8;
    u0f1s16 @14: Int16;
    u0f1s32 @15: Int32;
    u0f1s64 @16: Int64;
    u0f1sp  @17: Text;
  }

  # Pack one bit in order to make pathological situation for union1.
  bit0 @18: Bool;

  union1 @1 union {
    # Pack pathologically bad case.  Each field takes up new space.
    u1f0s0  @19: Void;
    u1f0s1  @20: Bool;
    u1f1s1  @21: Bool;
    u1f0s8  @22: Int8;
    u1f1s8  @23: Int8;
    u1f0s16 @24: Int16;
    u1f1s16 @25: Int16;
    u1f0s32 @26: Int32;
    u1f1s32 @27: Int32;
    u1f0s64 @28: Int64;
    u1f1s64 @29: Int64;
    u1f0sp  @30: Text;
    u1f1sp  @31: Text;

    # Pack more stuff into union1 -- should go into same space as u1f0s64.
    u1f2s0  @32: Void;
    u1f2s1  @33: Bool;
    u1f2s8  @34: Int8;
    u1f2s16 @35: Int16;
    u1f2s32 @36: Int32;
    u1f2s64 @37: Int64;
    u1f2sp  @38: Text;
  }

  # Fill in the rest of that bitfield from earlier.
  bit2 @39: Bool;
  bit3 @40: Bool;
  bit4 @41: Bool;
  bit5 @42: Bool;
  bit6 @43: Bool;
  bit7 @44: Bool;
  byte0 @49: UInt8;

  # Interleave two unions to be really annoying.
  # Also declare in reverse order to make sure union discriminant values are sorted by field number
  # and not by declaration order.
  union2 @2 union {
    u2f0s64 @54: Int64;
    u2f0s32 @52: Int32;
    u2f0s16 @50: Int16;
    u2f0s8 @47: Int8;
    u2f0s1 @45: Bool;
  }

  union3 @3 union {
    u3f0s64 @55: Int64;
    u3f0s32 @53: Int32;
    u3f0s16 @51: Int16;
    u3f0s8 @48: Int8;
    u3f0s1 @46: Bool;
  }
}

struct TestUnionDefaults {
  s16s8s64s8Set @0 :TestUnion =
      (union0 = u0f0s16(321), union1 = u1f0s8(123), union2 = u2f0s64(12345678901234567),
       union3 = u3f0s8(55));
  s0sps1s32Set @1 :TestUnion =
      (union0 = u0f1s0(void), union1 = u1f0sp("foo"), union2 = u2f0s1(true),
       union3 = u3f0s32(12345678));
}

struct TestNestedTypes {
  enum NestedEnum {
    foo @0;
    bar @1;
  }

  struct NestedStruct {
    enum NestedEnum {
      baz @0;
      qux @1;
      quux @2;
    }

    outerNestedEnum @0 :TestNestedTypes.NestedEnum = bar;
    innerNestedEnum @1 :NestedEnum = quux;
  }

  nestedStruct @0 :NestedStruct;

  outerNestedEnum @1 :NestedEnum = bar;
  innerNestedEnum @2 :NestedStruct.NestedEnum = quux;
}

struct TestUsing {
  using OuterNestedEnum = TestNestedTypes.NestedEnum;
  using TestNestedTypes.NestedStruct.NestedEnum;

  outerNestedEnum @1 :OuterNestedEnum = bar;
  innerNestedEnum @0 :NestedEnum = quux;
}
