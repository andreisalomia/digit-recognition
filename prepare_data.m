function [train_mat, train_val] = prepare_data (name, no_train_images)
  n = 784;
  
  % initializare train_mat.
  train_mat = zeros (no_train_images, n);
  
  %initializare train_val.
  train_val = zeros (1, no_train_images);
  
  # Incarcarea in memorie a setului
  d=load(name);
  
  # Obtinerea datelor de antrenament si a label urilor
  
  train_mat = d.trainX(1:no_train_images, :);
  
  train_val = d.trainY(1:no_train_images);
  
endfunction
