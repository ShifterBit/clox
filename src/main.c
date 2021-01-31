#include "chunk.h"
#include "common.h"
#include "debug.h"
#include "vm.h"

int main(int argc, const char *argv[]) {
  initVM();
  Chunk chunk;
  initChunk(&chunk);

  int constant = addConstant(&chunk, 1.2);

  writeChunk(&chunk, OP_CONSTANT, 13);
  writeChunk(&chunk, constant, 13);
  writeChunk(&chunk, OP_NEGATE, 13);
  writeChunk(&chunk, OP_RETURN, 13);

  disassembleChunk(&chunk, "test chunk");
  interpret(&chunk);
  freeVM();
  freeChunk(&chunk);

  return 0;
}
