#include "chunk.h"
#include "common.h"
#include "debug.h"

int main(int argc, const char *argv[]) {
  Chunk chunk;
  initChunk(&chunk);

  int constant = addConstant(&chunk, 1.2);

  writeChunk(&chunk, OP_CONSTANT, 13);
  writeChunk(&chunk, OP_RETURN, 42);
  writeChunk(&chunk, OP_RETURN, 42);

  disassembleChunk(&chunk, "test chunk");
  freeChunk(&chunk);


  return 0;
}
