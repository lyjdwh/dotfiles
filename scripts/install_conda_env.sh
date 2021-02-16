conda create -y -n tftorch python=3.8
conda activate tftorch
# tensorflow
conda install -y tensorflow-gpu
# pytorch
conda install -y pytorch torchvision torchaudio cudatoolkit=10.1 -c pytorch
# pytorch lightning
conda install -y pytorch-lightning -c conda-forge
# pyg
pip install torch-scatter -f https://pytorch-geometric.com/whl/torch-1.7.0+cu101.html
pip install torch-sparse -f https://pytorch-geometric.com/whl/torch-1.7.0+cu101.html
pip install torch-cluster -f https://pytorch-geometric.com/whl/torch-1.7.0+cu101.html
pip install torch-spline-conv -f https://pytorch-geometric.com/whl/torch-1.7.0+cu101.html
pip install torch-geometric
# others
conda install -y jupyter biopython seaborn
pip install ptipython black isort py3Dmol
pip install biopandas torchsnooper loguru optuna keras-tuner pretty_errors omegaconf tensor-sensor torch-summary
