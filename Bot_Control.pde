///////////////////////////////////////////////////////////////////////////////////////////////////////
// No, it's not a fancy dancy class like the snot nosed kids are doing these days.
// Now get the hell off my lawn.
///////////////////////////////////////////////////////////////////////////////////////////////////////
void pen_up() {
  String buf = "G1 Z0";
  is_pen_down = false;
  OUTPUT.println(buf);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
void pen_down() {
  String buf = "G1 Z1";
  is_pen_down = true;
  OUTPUT.println(buf);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
void move_abs(int x, int y) {
  String buf = "G1 X" + nf(x,0) + " Y" + nf(y,0);

  if (x < drawing_min_x) { drawing_min_x = x; }
  if (x > drawing_max_x) { drawing_max_x = x; }
  if (y < drawing_min_y) { drawing_min_y = y; }
  if (y > drawing_max_y) { drawing_max_y = y; }
  
  if (is_pen_down) {
    stroke(0, 100, 0, 100-(squiggle_count * sharpie_dry_out));
    line(x_old + center_x, y_old + center_y, x + center_x, y + center_y);
  }
  
  x_old = x;
  y_old = y;
  OUTPUT.println(buf);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

