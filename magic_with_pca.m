function [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs)
  [m, n] = size(train_mat);

  % initializare train
  train = zeros(m, n);

  % initializare miu
  miu = zeros(1, n);

  % initializare Y
  Y = zeros(m, pcs);

  % initializare Vk
  Vk = zeros(n, pcs);

  # Castul la double a matricei
  train=cast(train_mat, 'double');
  
  # Calcularea vectorului de medii pentru fiecare coloana
  
  miu=mean(train,1);

  # Pentru fiecare coloana din matrice se scade media aferenta
  for i=1:n
    train(:,i)=train(:,i)-miu(i);
  endfor

  # Calculam Z matricea de covarianta
  Z = ((train') * train) / (m - 1);

  [V, D] = eig(Z);

  # Sortam descrescator valorile proprii, oridnea acestora
  # fiind salvata in index_vector, apoi reordonam vectorii proprii
  [aux, index_vector] = sort(diag(D), 'descend');
  for i=1:n
    V(:, i)=V(:, index_vector(i));
  endfor

  # pastram doar primele pcs coloane
  Vk = V(:, 1:pcs);

  Y = train * Vk;

  train = Y * Vk';
endfunction
