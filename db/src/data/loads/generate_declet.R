a = 0:999;
# Generate a list of 1000 declets in hexadecimal form
positive1 = cbind(sprintf("%04X", a), "8", 0, sprintf("%03d",a));
# Generate a list wither the declet is 2 bits shifted
positive2 = cbind(sprintf("%04X", bitwShiftL(a,2)), "8", 2, sprintf("%03d",a));

# For negative values, perform inverse counting
negative1 = cbind(sprintf("%04X", a), "0", 0, sprintf("%03d",999-a));
negative2 = cbind(sprintf("%04X", bitwShiftL(a,2)), "0", 2, sprintf("%03d",999-a));

out = rbind(positive1, positive2, negative1, negative2);
colnames(out) <- c("declet", "sign", "shift", "number");
write.csv(out, file="declets.csv", row.names = FALSE)
