# Efficient multivariate feature filter using conditional mutual information

## Abstract

This reported work focuses on designing an efficient feature filter from a computational point of view. The proposed multivariate filter method using conditional mutual information selects a feature subset that maximises relevance to target class while minimising redundancy between features in O(N) time.

This program finds a set of features that is largely dependent to target classes in certain time period to successfully applied to streaming data.

This software is a Matlab implementation of the proposed method, highly specialized on problems of categorical data set classification. The original version of this program was written by Jaesung Lee.

### [Paper]
Jaesung Lee, and Dae-Won Kim, [“Efficient multivariate feature filter using conditional mutual information,”](http://air.cau.ac.kr/softwares/efs/lee2012efficient.pdf) Electronics Letters 48(3), 2012.

<!-- Koller, D., and Sahami, M., “Toward optimal feature selection,” Proceedings of 13th International Conference on Machine Learning, Bari, Italy, 284-292, 1996. -->
## License

This program is available for download for non-commercial use, licensed under the GNU General Public License, which is allows its use for research purposes or other free software projects but does not allow its incorporation into any type of commerical software.

## Sample Input and Output

It will find the index of input categorical features in orders of conditional dependency, named for user-specified variable. This code can executed under Matlab command window.

### [Usage]:
   `>> idx = p_fs( features, answer, limits );`

### [Description]
   features – a matrix that is composed of features \
   answer – a vector represents the class of each pattern is assigned to \
   limits – the number of features to be selected

By convention in the input features matrix, rows represent data (e.g. patterns) and columns represent features.

The number of selected features can be smaller than user-specified input value, i.e., limits, since the dependency of selected features may reach to maximum entropy.
