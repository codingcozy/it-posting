---
title: "효율적인 HNSW 인덱싱 대규모 병렬 처리를 통한 인덱스 빌드 시간 단축 하는 방법"
description: ""
coverImage: "/assets/img/2024-06-22-EfficientHNSWIndexingReducingIndexBuildTimeThroughMassiveParallelism_0.png"
date: 2024-06-22 21:34
ogImage:
  url: /assets/img/2024-06-22-EfficientHNSWIndexingReducingIndexBuildTimeThroughMassiveParallelism_0.png
tag: Tech
originalTitle: "Efficient HNSW Indexing: Reducing Index Build Time Through Massive Parallelism"
link: "https://medium.com/gsi-technology/efficient-hnsw-indexing-reducing-index-build-time-through-massive-parallelism-0fc848f68a17"
isUpdated: true
---

## 소개

검색 증강 생성 (RAG)을 위한 Generative AI (GenAI) 및 전자 상거래를 위한 추천과 같은 응용 프로그램에 의해 주도되는 벡터 데이터베이스 분야에서, HNSW (Hierarchical Navigable Small Worlds) 알고리즘은 근사 최근접 이웃 (ANN) 검색을 위해 상위 벡터 데이터베이스 제공 업체에서 많이 사용됩니다. 이 알고리즘은 빠른 검색과 좋은 검색률을 제공하지만 인덱스 빌드 시간이 길다는 점을 감수해야 합니다.

인덱스 빌드 시간이 길면 확장성 제한, 운영 비용 증가, 개발자들을 위한 실험 감소, 그리고 동적 데이터셋의 느린 업데이트와 같은 여러 가지 도전에 직면하게 됩니다.

본 블로그 포스트에서는 HNSW 인덱스를 빌드하는 데 오랜 시간이 걸리는 이유를 설명하고, 고도의 병렬성을 활용하여 CPU를 기반으로 한 기존 솔루션과 비교하여 인덱스 빌드 시간을 대략 85% 줄일 수 있는 솔루션을 제시합니다.

<div class="content-ad"></div>

## HNSW 개요

HNSW는 쿼리의 근사 최근 이웃을 효율적으로 탐색하는 그래프 기반 알고리즘입니다. 그래프에는 계층적 노드(벡터 임베딩)가 있으며, 각 계층에는 이전 계층의 일부가 포함됩니다. 노드는 에지로 연결되어 있으며, 에지는 그들 사이의 거리를 나타내며, 거리는 코사인 유사성과 같은 메트릭으로 측정됩니다.

상위 계층은 더 적은 노드와 더 긴 에지를 가지고 있어서 그래프의 먼 영역을 연결하고 벡터 공간을 빠르게 탐색할 수 있습니다. 가장 아래 계층에는 모든 벡터가 포함되어 있으며, 짧은 범위의 에지(인접 노드로의 연결)를 가지고 있어서 더 세부적인 검색이 가능합니다.

그림 1은 HNSW 그래프 구조의 간단한 예를 제공합니다.

<div class="content-ad"></div>

![이미지](/assets/img/2024-06-22-EfficientHNSWIndexingReducingIndexBuildTimeThroughMassiveParallelism_0.png)

인덱스를 구축하거나 업데이트하는 동안, 새 노드는 기존 노드로부터의 거리에 따라 삽입됩니다. 각 레이어마다 각 정점의 최근 이웃 목록이 유지되며, 해당 크기는 매개변수 ef_construction에 의해 결정됩니다.

알고리즘은 이 목록의 노드를 반복하면서, 가장 가까운 이웃들과의 거리 계산을 수행하여 노드의 이웃이 쿼리에 더 가까운지 확인합니다. 그렇다면 해당 이웃은 목록에 추가할 후보로 고려됩니다.

더 큰 ef_construction은 더 많은 후보를 추적하고 평가하여 실제 최근 이웃을 찾을 가능성을 높이며, 정확도를 향상시키지만 더 많은 거리 계산이 필요하기 때문에 인덱스 구축 시간이 늘어납니다.

<div class="content-ad"></div>

## 느린 인덱스 빌드 시간의 결과

이전 섹션에서 볼 수 있듯이, HNSW 인덱스를 구축하려면 계층적 그래프에서 가장 가까운 이웃을 찾기 위해 많은 거리 계산이 필요합니다. 이로 인해 검색 대기 시간이 낮고 재현율이 좋아지지만, 이는 빌드 및 업데이트가 느린 그래프라는 희생을 갖게 됩니다.

예를 들어, Figure 2에서 볼 수 있듯이, eBay의 경험에 따르면 1억 6천만 개의 벡터를 위해 HNSW 인덱스를 구축하는 데 3~6시간이 걸릴 수 있으며 데이터셋이 커질수록 빌드 시간이 빨리 증가합니다.

이는 수십억 개의 실시간 리스트가 있는 이러한 기업에게 문제가 될 수 있습니다.

<div class="content-ad"></div>

<img src="/assets/img/2024-06-22-EfficientHNSWIndexingReducingIndexBuildTimeThroughMassiveParallelism_1.png" />

느린 인덱스 빌드 시간은 많은 도전을 야기할 수 있습니다: 확장성 문제, 운영 비용 증가, 개발자 응용 프로그램 실험 제한 및 동적 데이터 세트 업데이트 지연.

확장성 문제

인덱스 빌드 시간이 느릴수록 전자 상거래 및 RAG와 같은 애플리케이션의 확장성이 제한됩니다. 전자 상거래의 경우, 고객 기반과 제품 카탈로그 확장으로 인덱스 빌드 시간이 증가하여 관련 제품 추천의 서비스가 지연됩니다. RAG의 경우, 더 큰 데이터 세트는 높은 품질의 응답을 제공하지만, 느린 인덱스 빌드로 효율적으로 관리할 수 있는 데이터 양이 제한됩니다.

<div class="content-ad"></div>

운영 비용 증가

인덱스 빌드 시간이 느린 경우 CPU 및 GPU와 같은 계산 리소스가 더 오래 사용됩니다. 이는 특히 리소스 사용에 비례한 비용이 발생하는 클라우드 컴퓨팅 환경에서 운영 비용을 증가시킵니다.

개발자 응용 프로그램 실험 제한

개발자들은 모델을 세밀하게 조정하고 응용 프로그램 성능을 개선하기 위해 빠르게 실험해야 합니다. 인덱스 빌드 시간이 길면 실험 횟수를 제한하고 그 실험을 평가하는 데 필요한 시간이 증가합니다. 이는 혁신을 늦추고 개선을 미루게 합니다.

<div class="content-ad"></div>

동적 데이터셋의 느린 업데이트

전자 상거래 및 RAG와 같은 애플리케이션에는 빈번히 업데이트되는 동적 데이터셋이 있습니다. 느린 인덱스 빌드는 새로운 데이터의 통합을 지연시켜 고갱도 비추천 및 응답의 만료로 이어지며, 이는 사용자 만족도 및 신뢰에 부정적인 영향을 미칠 수 있습니다.

## 인덱스 빌드 시간을 줄이는 방법

인덱스 빌드 시간을 줄이는 두 가지 효과적인 방법은 병렬 처리와 벡터 양자화입니다.

<div class="content-ad"></div>

병렬 처리

데이터 세트는 벡터 군집으로 분할되고 해당 군집 내에서 가장 가까운 이웃 거리 계산이 병렬로 수행됩니다. 병렬 처리는 거리 계산에 필요한 시간을 크게 줄여줍니다. 이는 인덱스 구축 과정 중 가장 시간이 많이 소요되는 부분입니다.

그러나 대부분의 HNSW 인덱스 빌드 솔루션에서 사용하는 CPU는 제한된 병렬 처리 능력을 갖고 있으므로 더 높은 병렬 처리 능력을 갖춘 솔루션이 필요합니다.

벡터 양자화

<div class="content-ad"></div>

벡터 양자화는 벡터를 압축하여 데이터 전송 당 더 많은 벡터를 포장할 수 있게 하며, 더 적은 비트에서 최근접 이웃 거리 계산을 수행하여 단순화합니다. 이로써 외부 메모리에서의 느린 메모리 접근 수를 줄이고 거리 계산 속도를 높일 수 있습니다.

## 메모리 내 계산 (CiM) 연상 처리 - 유연한 대규모 병렬 처리

GSI Technology의 메모리 내 계산 연상 처리 장치 (APU)는 백만 개의 비트 프로세서를 가진 기술로, 비트 수준에서 계산을 수행하여 유연한 양자화를 가능케 합니다. 이는 모든 크기의 데이터 요소에서 대규모 병렬 처리가 가능하도록 합니다.

APU를 사용하면 계산이 메모리 내에서 직접 수행되므로 프로세서와 메모리 간의 전통적인 병목 현상을 피할 수 있습니다.

<div class="content-ad"></div>

APU HNSW Index Build Process

1. 양자화: 데이터 세트를 원하는 비트 길이로 압축합니다 (예: 특성 당 4비트).

2. 클러스터링: K-평균 클러스터링을 사용하여 데이터 세트를 클러스터로 분할합니다.

3. 할당: 각 정점을 클러스터 중심까지의 거리를 기반으로 가장 가까운 클러스터에 할당합니다.

<div class="content-ad"></div>

4. 데이터 불러오기: 여러 클러스터를 APU에 로드합니다.

5. 최근접 이웃 탐색: APU에 로드된 클러스터에 할당된 정점들을 대상으로 최근접 이웃 탐색을 수행합니다.

6. 단계 4와 5 반복: 모든 클러스터가 처리되고 모든 정점이 그래프에 삽입될 때까지 단계 4와 5를 반복합니다.

7. 이웃들의 합집합: 각 정점에 대해 다수의 클러스터에서 가장 가까운 이웃들을 병합합니다.

<div class="content-ad"></div>

8. 최적화: 연결 후, 간선을 양방향으로 만들고 각 정점이 중복된 간선을 제거하여 `= K`개의 이웃을 보유하도록 보장합니다.

APU는 수백만 비트 프로세서를 사용하여 5단계에서의 최근접 이웃 거리 계산을 병렬로 수행합니다. 이 대규모 병렬 처리는 유연한 양자화와 함께 거리 계산에 필요한 시간을 크게 줄여줍니다. 최근접 이웃 거리 계산을 수행하는 것은 인덱스를 구축하는 가장 시간이 많이 소요되는 부분입니다. 이를 줄이는 것이 인덱스를 빠르게 구축하는 데 가장 큰 영향을 미칠 것입니다.

## 결과

Nvidia의 Figure 3에 따르면, 인텔 Xeon Platinum 8480CL CPU는 1억 개의 벡터를 위한 HNSW 인덱스를 구축하는 데 약 5,636초(약 1.5시간)가 걸리는 것을 보여줍니다.

<div class="content-ad"></div>

![Figure 4](/assets/img/2024-06-22-EfficientHNSWIndexingReducingIndexBuildTimeThroughMassiveParallelism_2.png)

Figure 4에 따르면 APU 시스템이 100 백만 벡터 HNSW 인덱스를 864초(약 15분)에 구축할 수 있습니다. 이는 Intel Xeon Platinum 8480CL CPU의 5,636초(약 1.5시간)에 비해 약 85%의 시간 단축입니다.

또한, Figure 4는 APU 시스템이 약 2시간에 10억 벡터 HNSW 인덱스를 구축할 수 있다는 것을 보여주며, 이는 10억 벡터를 가정하여 eBay의 성능 개선을 비교했을 때 극적인 향상을 보입니다.

![Figure 4](/assets/img/2024-06-22-EfficientHNSWIndexingReducingIndexBuildTimeThroughMassiveParallelism_3.png)

<div class="content-ad"></div>

## 결론

HNSW는 GenAI와 전자 상거래와 같은 애플리케이션에서 사용되는 벡터 유사성 검색에 중요한 알고리즘입니다. 높은 검색률과 빠른 검색을 제공하지만, 색인 빌드 시간이 길어지는 단점이 있습니다.

색인 빌드 시간을 줄이는 주요 방법 중 하나는 병렬화입니다. 안타깝게도 대부분의 현재 솔루션은 한정된 병렬 처리 능력을 갖춘 CPU를 사용합니다.

대량의 병렬 처리와 유연한 양자화를 통해 GSI Technology의 APU는 기존 CPU 기반 솔루션과 비교하여 색인 빌드 시간을 약 85% 줄일 수 있습니다. 이는 확장성을 향상시키고 운영 비용을 낮추며 빠른 개발자 애플리케이션 실험을 가능하게 하며, 동적 데이터 세트에 대한 적시적인 업데이트를 보장합니다.

<div class="content-ad"></div>

APU의 유연한 비트 수준 처리가 대량 병렬 처리를 제공하여 인덱스 빌드 시간을 크게 줄이는 방법에 대한 자세한 내용은 화이트페이퍼 "효율적인 HNSW: 인덱스 빌드 시간을 85%로 단축"을 읽어보세요.

GSI 기술의 온프레미스 및 클라우드 기반 HNSW 인덱스 빌드 옵션에 대해 알아보려면 associativecomputing@gsitechnology.com 으로 문의하세요.
