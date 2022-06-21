# Patos

[Link datasets](https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps)

```bash
 docker build -t "patos:Dockerfile" .
```

```bash
 docker run -it "patos:Dockerfile"
```

# Why some playstore apps are better than other 
---
## Contents:
  - [Description](#Description)
  - [Objectives](#Objectives)
  - [How to run the project](#How-to-run-the-project)
      - [Dataset](#Dataset)
      - [Docker](#Docker)
      - [Scripts](#Scripts)
  - [Results](#Results)
  
### Description
  - **Why some playstore apps are better than other** is a project that tries to understand, through data analysis, why some playstore apps are better than others.

### Objectives
- First objective
- Second objective
- Third objective

### How to run the project
- #### Dataset 
  - First, you need to have the dataset in the `dataset` directory. In the following [link](https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps) you can download the dataset.

- #### Docker
  - The project uses Pig Latin, so if you don't want to install PigLatin on your PC, you can create a docker container with everything you need to run the project.
    ```bash
      docker build -t "patos:Dockerfile" .
    ```
  - The following command allows to enter to the created container.
    ```bash
      docker run -it "patos:Dockerfile"
    ```

- #### Scripts
  - **Best group apps**
    - Description: The `best group apps` script groups the apps by different categories and counts how many apps exist for each group.
    - How to use: 
      ```bash
        pig best_group_apps.pig
      ```

  - **Best apps**
    - Description: 
    - How to use: 
      ```bash
        pig best_apps.pig
      ```

  - **Best apps**
    - Description: 
    - How to use: 
      ```bash
        pig best_apps.pig
      ```

### Results 


