#include <iostream>
#include <inmost.h>
#include <chrono>

using namespace INMOST;
int main(int argc, char *argv[]) {
    Solver::Initialize(&argc, &argv);
    
    Sparse::Matrix A;
    A.Load("/home/nataliya/svt/A_tet1.mtx");
    
    Sparse::Vector rhs;
    rhs.Load("/home/nataliya/svt/rhs_tet1.mtx");
    
    Sparse::Vector sol = rhs;
        

    Solver S(Solver::INNER_ILU2);
    S.SetParameter("drop_tolerance", "0.1");
    S.SetParameter("verbosity", "3");
    
    auto begin = std::chrono::steady_clock::now(); 
    
    S.SetMatrix(A);
    
    auto end = std::chrono::steady_clock::now();
    
    auto elapsed_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end - begin);
    std::cout << "ILU(2): " << elapsed_ms.count() << " ms\n";

    // Run preconditioned BiCGStab
    begin = std::chrono::steady_clock::now();
    
    bool solved = S.Solve(rhs, sol);
    
    end = std::chrono::steady_clock::now();
    
    elapsed_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end - begin);
    std::cout << "BiCGStab: " << elapsed_ms.count() << " ms\n";

    std::cout << "Number of iterations: " << S.Iterations() << std::endl;
    std::cout << "Residual: " << S.Residual() << std::endl;
    Solver::Finalize();

    return 0;
}
