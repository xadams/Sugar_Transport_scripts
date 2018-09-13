out_name = "rmsd_handshake_amd_1-5_new.txt"
# in1 = "rmsd_handshake_amd_1-3.txt"
# in2 = "rmsd_handshake_amd_3-5.txt"
in1 = "rmsd_handshake_amd_1-5_front_half.txt"
in2 = "rmsd_handshake.txt"
i = 0

# for appending two files starting at a midpoint of file 1. Easily done in bash and not too useful
# with open(out_name, 'w') as outfile:
#     with open(in1, 'rt') as fin1:
#         with open(in2, 'rt') as fin2:
#             for line1 in fin1:
#                 if i < 2002:
#                     outfile.write(line1)
#                     i += 1
#                 else:
#                     for line2 in fin2:
#                         outfile.write(line2)
#                     break

# for appending file 2 lines to the end of corresponding lines of file 1
with open(out_name, 'w') as outfile:
    with open(in1) as fin1, open(in2) as fin2:
      for x, y in zip(fin1,fin2):
        x = x.strip()
        y = y.strip()
        outfile.write("{0} {1}\n".format(x,y))
