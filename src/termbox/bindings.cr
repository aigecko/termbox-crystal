@[Link(ldflags: "-L/usr/local/lib -ltermbox")]
lib TermboxBindings
  alias Char = LibC::Char
  alias Int = LibC::Int
  alias UInt = LibC::UInt
  alias Long = LibC::Long
  alias ULong = LibC::ULong
  alias SizeT = LibC::SizeT
  alias Double = LibC::Double

  # Cell struct
  struct Cell
    ch: UInt32
    fg: UInt16
    bg: UInt16
  end

  # Event struct
  struct Event
    type: UInt8
    mod: UInt8
    key: UInt16
    ch: UInt32
    w: Int32
    x: Int32
    y: Int32
  end

  # API
  fun tb_init(): Int
  fun tb_shutdown(): Void
  fun tb_width(): Int
  fun tb_height(): Int
  fun tb_clear(): Void
  fun tb_set_clear_attributes(fg: UInt16, bg: UInt16): Void
  fun tb_present(): Void
  fun tb_set_cursor(x: Int, y: Int): Void
  fun tb_put_cell(x: Int, y: Int, cell: Pointer(Cell)): Void
  fun tb_change_cell(x: Int, y: Int, ch: UInt32, fg: UInt16, bg: UInt16): Void
  fun tb_select_input_mode(mode: Int): Int
  fun tb_select_output_mode(mode: Int): Int
  fun tb_peek_event(event: Pointer(Event), timeout: Int): Int
  fun tb_poll_event(event: Pointer(Event)): Int
end
